const database = "GadgetGalaxy";
const collection = "products";

use(database);

/*db.createCollection(collection, {
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

db.collection.insertMany([
    {name: "Wireless Mouse", price: 40, inStock: true, specs: {brand: "Logitech"}},
    {name: "Mechanical Keyboard", price: 120, inStock: false, specs: {brand: "SteelSeries"}},
    {name: "Gaming Monitor", price: 220, inStock: true, specs: {brand: "Dell"}}
]); */


