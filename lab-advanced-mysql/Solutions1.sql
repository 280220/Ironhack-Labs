USE publications;
SELECT a.au_id, a.au_lname, a.au_fname, 
(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) AS TOTAL
FROM publications.authors a
LEFT JOIN publications.titleauthor ta
ON a.au_id = ta.au_id
LEFT JOIN publications.titles t
ON t.title_id = ta.title_id
LEFT JOIN publications.sales s
ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;

SELECT a.au_id, a.au_lname, a.au_fname,
sum(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) AS sales_royalty
FROM publications.authors a
INNER JOIN  publications.titleauthor ta
ON a.au_id = ta.au_id
INNER JOIN publications.titles t
ON ta.title_id = t.title_id
INNER JOIN publications.sales s
ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname;

SELECT a.au_id, a.au_lname, a.au_fname,
sum((t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) + t.advance * (t.royalty / 100)) AS sales_royalty
FROM publications.authors a
INNER JOIN  publications.titleauthor ta
ON a.au_id = ta.au_id
INNER JOIN publications.titles t
ON ta.title_id = t.title_id
INNER JOIN publications.sales s
ON t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname;

CREATE TEMPORARY TABLE temporary_publications2
SELECT a.au_id, a.au_lname, a.au_fname, 
(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) AS TOTAL,
sum((t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) + t.advance * (t.royalty / 100)) AS sales_royalty2
FROM publications.authors a
LEFT JOIN publications.titleauthor ta
ON a.au_id = ta.au_id
LEFT JOIN publications.titles t
ON t.title_id = ta.title_id
LEFT JOIN publications.sales s
ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;

SELECT * FROM temporary_publications2;
SELECT au_id, sales_royalty2, TOTAL
FROM temporary_publications2;


CREATE TABLE most_profitable_authors
SELECT a.au_id, a.au_lname, a.au_fname, 
(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) AS TOTAL,
sum((t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) + t.advance * (t.royalty / 100)) AS most_profitable
FROM publications.authors a
LEFT JOIN publications.titleauthor ta
ON a.au_id = ta.au_id
LEFT JOIN publications.titles t
ON t.title_id = ta.title_id
LEFT JOIN publications.sales s
ON t.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;

SELECT au_id, most_profitable, TOTAL
FROM most_profitable_authors;