USE controlecomputdores


--Ex1
SELECT dp.idDepto, dp.depto 
FROM depto dp 
LEFT OUTER JOIN usuario us 
ON dp.idDepto = us.depto WHERE us.depto IS NULL

--Ex2
SELECT DISTINCT s.nome, dp.depto
FROM software s 
INNER JOIN softwareMaquina sm 
ON s.idSoftware = sm.idSoftware 
INNER JOIN maquina mq 
ON sm.idMaquina = mq.idMaquina 
INNER JOIN usuarioMaquina um 
ON mq.idMaquina = um.idMaquina 
INNER JOIN usuario us 
ON um.idUsuario = us.idUsuario 
INNER JOIN depto dp 
ON us.depto = dp.idDepto 
WHERE dp.depto like 'Desenvolvimento'

--Ex3
SELECT dp.depto, COUNT(dp.depto) AS qtdUsuarios
FROM usuario us 
INNER JOIN depto dp 
ON us.depto = dp.idDepto
GROUP BY dp.depto
ORDER BY qtdUsuarios ASC

--Ex4
SELECT 
CASE 
	WHEN LEN(nome) > 10 THEN
		SUBSTRING(nome, 1, 10) + '.'
	ELSE
		us.nome
	END as nome, 
ramal FROM usuario us 
INNER JOIN usuarioMaquina um 
ON us.idUsuario = um.idUsuario 
INNER JOIN horario hr 
ON um.horario = hr.idHorario
WHERE hr.horario like 'Manhã'