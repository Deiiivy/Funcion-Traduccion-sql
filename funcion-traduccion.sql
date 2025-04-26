CREATE FUNCTION dbo.TraducirFrase
(
    @Frase NVARCHAR(MAX),
    @IdIdioma INT
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @Resultado NVARCHAR(MAX) = @Frase;
    
    SELECT @Resultado = REPLACE(
        @Resultado COLLATE SQL_Latin1_General_CP1_CI_AI, 
        f.Texto COLLATE SQL_Latin1_General_CP1_CI_AI, 
        ISNULL(t.Texto, f.Texto)
    )
    FROM Frase f
    LEFT JOIN Traduccion t ON f.Id = t.IdFrase AND t.IdIdioma = @IdIdioma

    ORDER BY LEN(f.Texto) DESC;
    
    RETURN @Resultado;
END;
GO