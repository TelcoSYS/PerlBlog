SELECT b.id, title, c.name, l.name FROM blogs b, categories c, languajes l 
WHERE b.category_id = c.id AND b.languaje_id = l.id
LIMIT 0,25;
