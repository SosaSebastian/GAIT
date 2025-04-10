USE GAIT;

DELIMITER //

CREATE PROCEDURE calcularTotalVentas(
    IN fecha_inicio DATE,
    IN fecha_fin DATE,
    OUT total_ventas DECIMAL(10,2)
)
BEGIN
    SELECT SUM(op.subtotal) 
    INTO total_ventas
    FROM order_products op
    JOIN orders o ON op.id_order = o.id
    WHERE o.order_date BETWEEN fecha_inicio AND fecha_fin;
END //

DELIMITER ;