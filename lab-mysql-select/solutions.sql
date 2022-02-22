#Challenge 1 - Who Have Published What at Where?
SELECT a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
FROM publications.authors a
LeFT JOIN publications.titleauthor ta
ON a.au_id = ta.au_id
LEFT JOIN publications.titles t
ON t.title_id = ta.title_id
LEFT JOIN publications.publishers p
ON t.pub_id = p.pub_id
GROUP BY a.au_id;

#Challenge 2 - Who Have Published How Many At Where?
SELECT a.au_id, a.au_lname, a.au_fname, p.pub_name, COUNT(t.title) AS COUNT
FROM publications.authors a
LEFT JOIN publications.titleauthor ta
ON a.au_id = ta.au_id
LEFT JOIN publications.titles t
ON t.title_id = ta.title_id
LEFT JOIN publications.publishers p
ON t.pub_id = p.pub_id
GROUP BY a.au_id;

#Challenge 3 - Best Selling Authors
SELECT a.au_id, a.au_lname, a.au_fname, SUM(s.qty) AS TOTAL
FROM publications.authors a
LEFT JOIN publications.titleauthor ta
ON a.au_id = ta.au_id
LEFT JOIN publications.titles t
ON t.title_id = ta.title_id
LEFT JOIN publications.sales s
ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC LIMIT 3;

#Challenge 4 - Best Selling Authors Ranking
SELECT a.au_id, a.au_lname, a.au_fname, ifnull((s.qty),0) AS TOTAL
FROM publications.authors a
LEFT JOIN publications.titleauthor ta
ON a.au_id = ta.au_id
LEFT JOIN publications.titles t
ON t.title_id = ta.title_id
LEFT JOIN publications.sales s
ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;

