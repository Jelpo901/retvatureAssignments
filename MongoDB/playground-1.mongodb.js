const database = "GadgetGalaxy";
const collection = "products";

use(database);

/*db.createCollection(products, {
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["name", "price", "inStock"],
            additionalProperties: false,
            properties: {
                name: {
                    bsonType: "string",
                    description: "must be a string"
                },
                price: {
                    bsonType: ["int", "double"],
                    description: "must be an integer or double"
                },
                inStock: {
                    bsonType: "bool",
                    description: "must be a boolean"
                }
            }
        }
    },
    validationAction: "error"
});

db.products.insertMany([
    {name: "Wireless Mouse", price: 40, inStock: true, specs: {brand: "Logitech"}},
    {name: "Mechanical Keyboard", price: 120, inStock: false, specs: {brand: "SteelSeries"}},
    {name: "Gaming Monitor", price: 220, inStock: true, specs: {brand: "Dell"}}
]); */

//db.products.insertOne(name: 21, price: "this is wrong", inStock: maybe?);

/*db.products.updateOne(
    {name: "Wireless Mouse"},
    {$set: {category: "Accessories"}}
);

db.products.updateOne(
    {name: "Wireless Mouse"},
    {$inc: {price: 15}}
); 

db.products.insertOne(
    {name: "Wireless Mouse"},
    {$push: {tags: "wireless"}}
);

db.products.insertOne(
    {name: "Wireless Mouse"},
    {$push: {tags: "bestseller"}}
); 

db.products.updateOne(
    {name: "Wireless Mouse"},
    {$pull: {tags: "wireless"}}
); 

db.products.find(
    {price: {$gte: 150}}
); 

db.products.find(
    {"specs.brand": "Logitech"}
); 

db.products.find(
    {category: {$in: ["Accessories"]}}
); */