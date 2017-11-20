# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# creates an admin
User.create(name: "El administrador", email:"el@admin.com", admin: true, password: "12345678", confirmed_at: Time.now)

# creates an user
User.create(name: "El usuario", email:"el@user.com", password: "12345678", confirmed_at: Time.now)

User.find_by(email:"el@user.com").products.create(name: "Camisa para hombre", price: "20", desc: "Una camisa bien chevere", rating: 0, image: "https://i2.linio.com/p/e7ad556f25504c845047bd9a43e511ef-catalog.jpg")

User.find_by(email:"el@user.com").products.create(name: "Zapatos para hombre", price: "20", desc: "Unos zapatos bien cheveres", rating: 0, image: "https://http2.mlstatic.com/D_Q_NP_665705-MLA25054312861_092016-Q.jpg")

User.find_by(email:"el@user.com").products.create(name: "Google pixel", price: "20", desc: "Un celular bien chevere", rating: 0, image: "https://blogs-images.forbes.com/gordonkelly/files/2017/03/Screenshot-2017-03-06-at-00.37.39.png")

Category.create(name: "Accesorio para vehículos")
Category.create(name: "Animales y Mascotas")
Category.create(name: "Bebés")
Category.create(name: "Boletas para Espectáculos")
Category.create(name: "Cámaras y Accesorios")
Category.create(name: "Celulares y Teléfonos")
Category.create(name: "Coleccionables y Hobbies")
Category.create(name: "Computación")
Category.create(name: "Consolas y Videojuegos")
Category.create(name: "Deportes y Fitness")
Category.create(name: "Electrodomesticos")
Category.create(name: "Electrónica, Audio y Video")
Category.create(name: "Herramientas y Construcción")
Category.create(name: "Hogar y Muebles")
Category.create(name: "Industrias y Oficinas")
Category.create(name: "Instrumentos Musicales")
Category.create(name: "Juegos y Juguetes")
Category.create(name: "Libros, Revistas y Comics")
Category.create(name: "Música, Películas y Series")
Category.create(name: "Relojes y Joyas")
Category.create(name: "Ropa y Accesorios")
Category.create(name: "Salud y Belleza")
Category.create(name: "Otras categorías")

Product.find_by(name: "Camisa para hombre").tags.create(category_id: Category.find_by(name: "Ropa y Accesorios"))

Product.find_by(name: "Zapatos para hombre").tags.create(category_id: Category.find_by(name: "Ropa y Accesorios"))

Product.find_by(name: "Zapatos para hombre").tags.create(category_id: Category.find_by(name: "Celulares y Teléfonos"))