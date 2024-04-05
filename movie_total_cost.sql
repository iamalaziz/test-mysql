USE movie_tickets_system;


SELECT SUM(purchase.total_cost), movie.title FROM purchase
JOIN ticket ON purchase.fk_ticket_id = ticket.id
JOIN movie ON ticket.fk_movie_id = movie.id
WHERE movie.title = 'Spiderman' AND purchase.status = 'completed';
