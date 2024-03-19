-- This user defined function (UDF) can be employed to effictively clean your SQL data.
-- It will remove any accents from the input text and replace it with basic alphanumerical characters.
-- Any leading/trailing spaces will also be trimmed.
-- By default, it will also uppercase the complete text. Alternatively the "UPPER" function may be
-- set to "LOWER" instead for lowercase text.
-- The first argument of the UDF takes the input text, the second argument is optional ans sets the
-- maximum length. If it is not provided, the default length of 255 characters will be applied.

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[udf_cleantext](@input VARCHAR(MAX), @length INT)
RETURNS VARCHAR(MAX)
AS BEGIN
    IF @length IS NULL SET @length=255
    RETURN SUBSTRING(REPLACE(REPLACE(REPLACE(REPLACE(CAST(UPPER(TRIM(@input)) AS VARCHAR(MAX))COLLATE CYRILLIC_GENERAL_100_CI_AI, '?', ''), ' ', '<>'), '><', ''), '<>', ' '), 1, @length);
END;
GO
