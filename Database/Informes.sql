use sistemabancario;
SELECT 
    p.nombre AS Provincia, 
    COUNT(c.id_cliente) AS TotalClientes
FROM 
    cliente c
JOIN 
    provincia p ON c.id_provincia = p.id_provincia
WHERE 
    c.activo = 1
GROUP BY 
    p.nombre
ORDER BY 
    TotalClientes DESC;
