
-- Пункт HZ
SELECT table_name, table_rows FROM information_schema.tables
WHERE table_schema='oparishok';

-- Пункт 2.5, 2.6, 3.17
SELECT u.id, u.full_name, r.name AS role
FROM users u
JOIN roles r ON r.id = u.role_id
WHERE u.login = '94d5ous@gmail.com' AND u.password = "uzWC67";

-- Пункт 2.7–2.11
SELECT p.id, p.article, p.name, p.unit, p.price, p.discount, p.stock_qty,
       p.description, p.photo,
       c.name AS category, m.name AS manufacturer, s.name AS supplier
FROM products p
JOIN categories c ON c.id = p.category_id
JOIN manufacturers m ON m.id = p.manufacturer_id
JOIN suppliers s ON s.id = p.supplier_id;

-- Пункт 3.2–3.3 (3.4–3.5
SELECT p.id, p.name, p.unit, p.price, o.order_date, o.delivery_date, 
	Ord.name, pr.qty
FROM products p
JOIN prodorders Pr  ON Pr.id = p.id 
JOIN orders o ON o.id = Pr.order_id
JOIN orderstatus Ord ON Ord.id = o.status_id
WHERE p.name LIKE CONCAT('%', "Туфли", '%') AND Ord.name = "Завершен"
ORDER BY p.price ;

SELECT p.id, p.name, p.unit, p.price
FROM products p
WHERE p.name LIKE CONCAT('%', "Туфли", '%') AND p.discount = 2
ORDER BY p.price ;

-- Пункт (3.7, 3.10, 3.12, 3.19
-- справочники для выпадающих списков в форме
SELECT id, name FROM categories;
SELECT id, name FROM manufacturers;
SELECT id, name FROM suppliers;
SELECT * FROM products;

-- Пункт (3.7, 3.10, 3.12, 3.19
-- добавление товара
INSERT INTO products
  (article, name, unit, price, discount, stock_qty, description, photo, category_id, 
manufacturer_id, supplier_id)
VALUES ("J817Т6", "Туфли", "шт",5555.99 , 50, 32, "тралала-тра-лала-бебебе-шур-шур-шур", "очень красиво.png", 2,
 1, 2);
 
  -- Пункт (3.7, 3.10, 3.12, 3.19
-- открыть товар для редактирования — заполнить все поля сразу
SELECT * FROM products WHERE id = 12;

-- Пункт (3.7, 3.10, 3.12, 3.19
-- сохранить изменения
UPDATE products
SET article= "Q553W6", name="Подкрадули", unit="шт", price=1256.44, 
discount=7, stock_qty=6, description="Мечта каждой женщины, кстати есть такой фильм", photo="у меня фантазия кончается.png",
    category_id=1, manufacturer_id=2, supplier_id=1
WHERE id = 12;

-- 3.16 
SELECT COUNT(*) AS used_in_orders FROM prodorders WHERE product_id = 10;

DELETE FROM products WHERE id = 10;

