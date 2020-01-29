require 'csv'

Dir.glob("csv/*.csv") do |path| 
    puts "-----------------"
    puts path
    CSV.foreach(path, headers: true) do |row|
        Item.create!(
            created_at:     row['created_at'],
            updated_at:     row['updated_at'],
            manufacturer:   row['manufacturer'],
            name:           row['name'],
            thickness:      row['thickness'],
            length:         row['length'],
            material:       row['material'],
            tip_material:   row['tip_material'],
            tip_shape:      row['tip_shape'],
            img_path:       row['img_path'],
            taper:          row['taper'],
            price:          row['price']
        )
    end
end
