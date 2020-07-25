from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow

import json

# Initialize app
app = Flask(__name__)

# Database config
app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+pymysql://username:password@localhost/ecomm_fapi"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Establish database connection
# flask-alchemy uses flask's app config
db = SQLAlchemy(app)

 
# Define category model that has one to many relationship with product model
class Category(db.Model):
    category_id = db.Column(db.Integer, primary_key=True)
    category_name = db.Column(db.String(20), nullable=False)
    parent_category_id = db.Column(db.Integer)
    products = db.relationship("Product", backref="category", lazy=True)

    def __repr__(self):
        return "Category: {}".format(self.category_name)


class Product(db.Model):
    product_id = db.Column(db.Integer, primary_key=True)
    product_name = db.Column(db.String(256), nullable=False)
    price = db.Column(db.Float(2), nullable=False)
    category_id = db.Column(db.Integer, db.ForeignKey(
        "category.category_id"), nullable=False)

    def __repr__(self):
        return "Product:{}, Price:{}".format(self.product_name, self.price)


# welcome page, can be configure for other purpose
@app.route("/")
def index():
    return jsonify({'msg': 'try different urls!'})


# returns json which has all categories with accumulated price and number of product count
@app.route("/categories", methods=["GET"])
def get_categories():

    # recursiverly count price of each category and sub-category
    def get_price_category(category, has_subcatgory):

        price_total = 0.0

        if category.parent_category_id is None and has_subcatgory:
            sub_categories_list = Category.query.filter_by(
                parent_category_id=category.category_id).all()

            for subcat in sub_categories_list:
                price_total += get_price_category(category=subcat,
                                                  has_subcatgory=category.category_id != subcat.category_id)

        else:
            price_total = sum([p.price for p in category.products])

        return price_total

    # recursively count number of product in each category and sub-category
    def get_product_count(category, has_subcatgory):

        count = 0

        if category.parent_category_id is None and has_subcatgory:
            sub_categories_list = Category.query.filter_by(
                parent_category_id=category.category_id).all()

            for subcat in sub_categories_list:
                count += get_product_count(category=subcat,
                                           has_subcatgory=category.category_id != subcat.category_id)
        else:
            count = len(category.products)

        return count

    # response to sent to client side
    response = {'categories': []}

    # fetch all categories along with products in that category from database
    categories = Category.query.all()

    # safety check
    if categories is not None:

        # Iterate to each category and prepare response
        for category in categories:

            category_name = category.category_name
            has_subcatgory = category.parent_category_id is None
            price_total = get_price_category(category, has_subcatgory)
            product_count = get_product_count(category, has_subcatgory)

            response['categories'].append({
                'category_name': category_name, 'has_subcatgory': has_subcatgory,
                'price_total': price_total, 'product_count': product_count
            })

    # return json response
    return jsonify(response)


'''
returns json response of filtered product along with pagination data that can be utilized by front-end client such as react
parameters required:
    categories : list of categories to apply filter on
    page : current page
'''


@app.route("/filter", methods=["POST"])
def filter():

    categories_to_filter = request.json['categories']
    page = int(request.json['page'])

    response = {'total': 0, 'total_price': 0, 'avg_price': 0,
                'page_info': {'prev_page': 0, 'has_prev': False, 'current_page': 0,
                              'next_page': 0, 'has_next': False, 'pages': []},
                'items': []
                }

    # fetch all product which has given categories
    products = Product.query.join(Product.category).filter(
        Category.category_name.in_(categories_to_filter))

    # check if there's any more than one product
    if products.count() > 0:

        # count total price of every filtered product
        total_price = sum([p.price for p in products])

        # paginate filtered product using flask-sqlalchemy pagination api
        products_paginated = products.paginate(page=page, per_page=10)
        response['total'] = products_paginated.total
        response['total_price'] = sum([p.price for p in products])
        response['avg_price'] = total_price//products_paginated.total

        response['page_info']['has_prev'] = products_paginated.has_prev
        response['page_info']['prev_page'] = products_paginated.prev_num
        response['page_info']['current_page'] = products_paginated.page
        response['page_info']['has_next'] = products_paginated.has_next
        response['page_info']['next_page'] = products_paginated.next_num
        response['page_info']['pages'] = [
            x for x in products_paginated.iter_pages()]

        for product in products_paginated.items:
            name = product.product_name
            category = product.category.category_name
            price = product.price

            response['items'].append(
                {'product_name': name, 'product_category': category, 'price': product.price})

    return jsonify(response)


if __name__ == "__main__":
    app.run(debug=True)
