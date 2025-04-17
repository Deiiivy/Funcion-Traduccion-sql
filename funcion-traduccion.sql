CREATE FUNCTION dbo.TraducirFrase
(
    @Frase NVARCHAR(MAX),
    @IdIdioma INT
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @FraseTraducida NVARCHAR(MAX) = @Frase;

    SELECT @FraseTraducida = REPLACE(@FraseTraducida, f.Texto, ISNULL(t.Texto, f.Texto))
    FROM Frase f
    LEFT JOIN Traduccion t ON t.IdFrase = f.Id AND t.IdIdioma = @IdIdioma;

    RETURN @FraseTraducida;
END;
GO
