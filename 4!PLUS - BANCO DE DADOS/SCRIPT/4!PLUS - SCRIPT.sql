USE [master]
GO
/****** Object:  Database [OFICINA]    Script Date: 30/10/2015 14:38:01 ******/
CREATE DATABASE [OFICINA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OFICINA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\OFICINA.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OFICINA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\OFICINA_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OFICINA] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OFICINA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OFICINA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OFICINA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OFICINA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OFICINA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OFICINA] SET ARITHABORT OFF 
GO
ALTER DATABASE [OFICINA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OFICINA] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [OFICINA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OFICINA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OFICINA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OFICINA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OFICINA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OFICINA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OFICINA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OFICINA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OFICINA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OFICINA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OFICINA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OFICINA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OFICINA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OFICINA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OFICINA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OFICINA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OFICINA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OFICINA] SET  MULTI_USER 
GO
ALTER DATABASE [OFICINA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OFICINA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OFICINA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OFICINA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [OFICINA]
GO
/****** Object:  StoredProcedure [dbo].[uspClienteAlterar]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspClienteAlterar]

        @ID_CLIENTE INT,
	@NOME varchar(50),
        @CPF varchar(20),
        @CEP varchar(20),
        @ENDEREÇO varchar(50),
        @NUMERO int,
        @COMPLEMENTO varchar(2),
        @BAIRRO varchar(30),
        @CIDADE varchar(30),
        @UF varchar(2),
        @TEL_RESIDENCIAL varchar(20),
        @TEL_CELULAR varchar(20),
        @EMAIL varchar(40)

AS
BEGIN

UPDATE CLIENTE
SET
	
           NOME = @NOME,
           CPF = @CPF,
           CEP = @CEP,
           ENDEREÇO = @ENDEREÇO,
           NUMERO = @NUMERO,
           COMPLEMENTO = @COMPLEMENTO,
           BAIRRO = @BAIRRO,
           CIDADE = @CIDADE,
           UF = @UF,
           TEL_RESIDENCIAL = @TEL_RESIDENCIAL,
		TEL_CELULAR = @TEL_CELULAR,
		EMAIL = @EMAIL
WHERE

ID_CLIENTE = @ID_CLIENTE

SELECT @ID_CLIENTE AS Retorno

END
GO
/****** Object:  StoredProcedure [dbo].[uspClienteConsultarPorID]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspClienteConsultarPorID]
@ID_CLIENTE	int
AS
BEGIN

SELECT
		ID_CLIENTE,
		NOME,
           CPF,
           CEP,
           ENDEREÇO,
           NUMERO,
           COMPLEMENTO,
           BAIRRO,
           CIDADE,
           UF,
           TEL_RESIDENCIAL,
           TEL_CELULAR,
           EMAIL

		   FROM
		   CLIENTE

		   WHERE 

		   ID_CLIENTE = @ID_CLIENTE

		   END
GO
/****** Object:  StoredProcedure [dbo].[uspClienteConsultarPorNome]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspClienteConsultarPorNome]
@NOME varchar(50)
AS
BEGIN

SELECT
		ID_CLIENTE,
		NOME,
           CPF,
           CEP,
           ENDEREÇO,
           NUMERO,
           COMPLEMENTO,
           BAIRRO,
           CIDADE,
           UF,
           TEL_RESIDENCIAL,
           TEL_CELULAR,
           EMAIL

		   FROM
		   CLIENTE

		   WHERE 

		   NOME LIKE '%' + @NOME + '%'

		   END
GO
/****** Object:  StoredProcedure [dbo].[uspClienteExcluir]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspClienteExcluir]
	
	@ID_CLIENTE	int

AS
BEGIN

	DELETE FROM
		CLIENTE

		WHERE
		
		ID_CLIENTE = @ID_CLIENTE

		SELECT @ID_CLIENTE AS Retorno

END
GO
/****** Object:  StoredProcedure [dbo].[uspClienteInserir]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspClienteInserir]
	@NOME varchar(50),
        @CPF varchar(20),
        @CEP varchar(20),
        @ENDEREÇO varchar(50),
        @NUMERO int,
        @COMPLEMENTO varchar(2),
        @BAIRRO varchar(30),
        @CIDADE varchar(30),
        @UF varchar(2),
        @TEL_RESIDENCIAL varchar(20),
        @TEL_CELULAR varchar(20),
        @EMAIL varchar(40)

AS
BEGIN

		INSERT INTO CLIENTE
		(
           NOME,
           CPF,
           CEP,
           ENDEREÇO,
           NUMERO,
           COMPLEMENTO,
           BAIRRO,
           CIDADE,
           UF,
           TEL_RESIDENCIAL,
           TEL_CELULAR,
           EMAIL
		 )

     VALUES
	 (
           @NOME,
           @CPF,
           @CEP,
           @ENDEREÇO,
           @NUMERO,
           @COMPLEMENTO,
           @BAIRRO,
           @CIDADE,
           @UF,
           @TEL_RESIDENCIAL,
           @TEL_CELULAR,
           @EMAIL
	)

	SELECT @@IDENTITY AS Retorno
END
GO
/****** Object:  StoredProcedure [dbo].[uspDefeitoAlterar]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspDefeitoAlterar]

		@ID_DEFEITO INT,
		@NOME_DEFEITO varchar (50),
        @DESCRIÇÃO varchar (200),
        @VALOR varchar (20)
        

AS
BEGIN

		UPDATE DEFEITO
		SET
       
           NOME_DEFEITO = @NOME_DEFEITO,
           DESCRIÇÃO = @DESCRIÇÃO,
           VALOR = @VALOR
           

		 WHERE

		 ID_DEFEITO = @ID_DEFEITO

	SELECT @ID_DEFEITO AS Retorno

END
GO
/****** Object:  StoredProcedure [dbo].[uspDefeitoConsultarPorID]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspDefeitoConsultarPorID]
@ID_DEFEITO	int
AS
BEGIN

SELECT
		ID_DEFEITO,
		NOME_DEFEITO,
           DESCRIÇÃO,
           VALOR

		   FROM
		   DEFEITO

		   WHERE 

		   ID_DEFEITO = @ID_DEFEITO

		   END
GO
/****** Object:  StoredProcedure [dbo].[uspDefeitoConsultarPorNome]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspDefeitoConsultarPorNome]
@NOME_DEFEITO varchar(50)
AS
BEGIN

SELECT
		ID_DEFEITO,
		NOME_DEFEITO,
           DESCRIÇÃO,
           VALOR

		   FROM
		   DEFEITO

		   WHERE 

		   NOME_DEFEITO LIKE '%' + @NOME_DEFEITO + '%'

		   END
GO
/****** Object:  StoredProcedure [dbo].[uspDefeitoExcluir]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspDefeitoExcluir]
	
	@ID_DEFEITO	int

AS
BEGIN

	DELETE FROM
		DEFEITO

		WHERE
		
		ID_DEFEITO = @ID_DEFEITO

		SELECT @ID_DEFEITO AS Retorno

END
GO
/****** Object:  StoredProcedure [dbo].[uspDefeitoInserir]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspDefeitoInserir]

	@NOME_DEFEITO varchar (50),
        @DESCRIÇÃO varchar (200),
        @VALOR varchar (20)

AS
BEGIN

		INSERT INTO DEFEITO
		(
           NOME_DEFEITO,
           DESCRIÇÃO,
           VALOR

		 )

     VALUES
	 (
           @NOME_DEFEITO,
           @DESCRIÇÃO,
           @VALOR
	)

	SELECT @@IDENTITY AS Retorno
END
GO
/****** Object:  StoredProcedure [dbo].[uspMecanicaAlterar]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspMecanicaAlterar]

		@ID_MECANICA Int,
		@NOME_MECANICA VARCHAR(50),
        @CNPJ VARCHAR (20),
        @CEP VARCHAR(20),
        @ENDEREÇO VARCHAR(50),
        @NUMERO int,
        @COMPLEMENTO VARCHAR(2),
        @BAIRRO VARCHAR(30),
        @CIDADE VARCHAR(30),
        @UF VARCHAR(2),
        @TEL_COMERCIAL VARCHAR (20)

AS
BEGIN

		UPDATE MECANICA
		SET
           NOME_MECANICA = @NOME_MECANICA,
           CNPJ = @CNPJ,
           CEP = @CEP,
           ENDEREÇO = @ENDEREÇO,
           NUMERO = @NUMERO,
           COMPLEMENTO = @COMPLEMENTO,
           BAIRRO = @BAIRRO,
           CIDADE = @CIDADE,
           UF = @UF,
           TEL_COMERCIAL = @TEL_COMERCIAL
		 

		 WHERE

		 ID_MECANICA = @ID_MECANICA

	SELECT @ID_MECANICA AS Retorno

END
GO
/****** Object:  StoredProcedure [dbo].[uspMecanicaConsultarPorID]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspMecanicaConsultarPorID]
@ID_MECANICA	int
AS
BEGIN

SELECT
		ID_MECANICA,
		NOME_MECANICA,
           CNPJ,
           CEP,
           ENDEREÇO,
           NUMERO,
           COMPLEMENTO,
           BAIRRO,
           CIDADE,
           UF,
           TEL_COMERCIAL

		   FROM
		   MECANICA

		   WHERE 

		   ID_MECANICA = @ID_MECANICA


		   END
GO
/****** Object:  StoredProcedure [dbo].[uspMecanicaConsultarPorNome]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspMecanicaConsultarPorNome]
@NOME_MECANICA varchar(50)
AS
BEGIN

SELECT
		ID_MECANICA,
		NOME_MECANICA,
           CNPJ,
           CEP,
           ENDEREÇO,
           NUMERO,
           COMPLEMENTO,
           BAIRRO,
           CIDADE,
           UF,
           TEL_COMERCIAL

		   FROM
		  MECANICA

		   WHERE 

		   NOME_MECANICA LIKE '%' + @NOME_MECANICA + '%'

		   END
GO
/****** Object:  StoredProcedure [dbo].[uspMecanicaExcluir]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspMecanicaExcluir]
	
	@ID_MECANICA	int

AS
BEGIN

	DELETE FROM
		MECANICA

		WHERE
		
		ID_MECANICA = @ID_MECANICA

		SELECT @ID_MECANICA AS Retorno

END
GO
/****** Object:  StoredProcedure [dbo].[uspMecanicaInserir]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspMecanicaInserir]

	@NOME_MECANICA varchar(50),
        @CNPJ varchar(20),
        @CEP varchar(20),
        @ENDEREÇO varchar(50),
        @NUMERO int,
        @COMPLEMENTO varchar(2),
        @BAIRRO varchar(30),
        @CIDADE varchar(30),
        @UF varchar(2),
        @TEL_COMERCIAL varchar(20)
AS
BEGIN

		INSERT INTO MECANICA
		(
           NOME_MECANICA,
           CNPJ,
           CEP,
           ENDEREÇO,
           NUMERO,
           COMPLEMENTO,
           BAIRRO,
           CIDADE,
           UF,
           TEL_COMERCIAL
		 )

     VALUES
	 (
           @NOME_MECANICA,
           @CNPJ,
           @CEP,
           @ENDEREÇO,
           @NUMERO,
           @COMPLEMENTO,
           @BAIRRO,
           @CIDADE,
           @UF,
           @TEL_COMERCIAL
	)

	SELECT @@IDENTITY AS Retorno
END
GO
/****** Object:  StoredProcedure [dbo].[uspOSAlterar]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspOSAlterar]

@ID_OS INT,
@ID_CLIENTE INT,
@ID_DEFEITO INT,
@ID_VEICULO INT,
@ID_MECANICA INT,
@DATA VARCHAR(30),
@STATUS_OS VARCHAR(30),
@NOME_CLIENTE VARCHAR (50),
@CPF_CLIENTE VARCHAR (20),
@PLACA_CLIENTE VARCHAR (20),
@MARCA_CLIENTE VARCHAR(30),
@MODELO_CLIENTE VARCHAR(30),
@ANO_CLIENTE INT,
@NOME_MECANICA VARCHAR(50),
@NOME_DEFEITO VARCHAR(50),
@DESCRIÇÃO_DEFEITO VARCHAR (200),
@VALOR_DEFEITO VARCHAR (20),
@VALOR_MECANICA VARCHAR (20),
@VALOR_OFICINA VARCHAR (20),
@VALOR_TOTAL VARCHAR (20),
@CADASTRO VARCHAR (50)

AS
BEGIN

UPDATE OS
SET
ID_CLIENTE = @ID_CLIENTE,
ID_DEFEITO = @ID_DEFEITO,
ID_VEICULO = @ID_VEICULO,
ID_MECANICA = @ID_MECANICA,
DATA = @DATA,
STATUS_OS = @STATUS_OS,
NOME_CLIENTE = @NOME_CLIENTE,
CPF_CLIENTE = @CPF_CLIENTE ,
PLACA_CLIENTE = @PLACA_CLIENTE ,
MARCA_CLIENTE = @MARCA_CLIENTE ,
MODELO_CLIENTE = @MODELO_CLIENTE ,
ANO_CLIENTE = @ANO_CLIENTE ,
NOME_MECANICA = @NOME_MECANICA,
NOME_DEFEITO = @NOME_DEFEITO,
DESCRIÇÃO_DEFEITO = @DESCRIÇÃO_DEFEITO,
VALOR_DEFEITO = @VALOR_DEFEITO,
VALOR_MECANICA = @VALOR_MECANICA,
VALOR_OFICINA = @VALOR_OFICINA,
VALOR_TOTAL = @VALOR_TOTAL,
CADASTRO = @CADASTRO

WHERE

ID_OS = @ID_OS

SELECT @ID_OS AS Retorno

END
GO
/****** Object:  StoredProcedure [dbo].[uspOsConsultarPorID]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspOsConsultarPorID]
@ID_OS	int
AS
BEGIN

SELECT
		ID_OS,
ID_CLIENTE,
ID_DEFEITO,
ID_VEICULO,
ID_MECANICA,
DATA,
STATUS_OS,
NOME_CLIENTE,
CPF_CLIENTE,
PLACA_CLIENTE,
MARCA_CLIENTE,
MODELO_CLIENTE,
ANO_CLIENTE,
NOME_MECANICA,
NOME_DEFEITO,
DESCRIÇÃO_DEFEITO,
VALOR_DEFEITO,
VALOR_MECANICA,
VALOR_OFICINA,
VALOR_TOTAL,
CADASTRO
		   FROM
		   OS

		   WHERE 

		   ID_OS = @ID_OS

		   END
GO
/****** Object:  StoredProcedure [dbo].[uspOsConsultarPorNome]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspOsConsultarPorNome]
@NOME_CLIENTE VARCHAR (50)
AS
BEGIN

SELECT
ID_OS,
ID_CLIENTE,
ID_DEFEITO,
ID_VEICULO,
ID_MECANICA,
DATA,
STATUS_OS,
NOME_CLIENTE,
CPF_CLIENTE,
PLACA_CLIENTE,
MARCA_CLIENTE,
MODELO_CLIENTE,
ANO_CLIENTE,
NOME_MECANICA,
NOME_DEFEITO,
DESCRIÇÃO_DEFEITO,
VALOR_DEFEITO,
VALOR_MECANICA,
VALOR_OFICINA,
VALOR_TOTAL,
CADASTRO

		   FROM
		   OS

		   WHERE 

		   NOME_CLIENTE LIKE '%' + @NOME_CLIENTE + '%'

		   END
GO
/****** Object:  StoredProcedure [dbo].[uspOsExcluir]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspOsExcluir]
	
	@ID_OS	int

AS
BEGIN

	DELETE FROM
		OS

		WHERE
		
		ID_OS = @ID_OS

		SELECT @ID_OS AS Retorno

END
GO
/****** Object:  StoredProcedure [dbo].[uspOsInserir]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspOsInserir]


@ID_CLIENTE INT,
@ID_DEFEITO INT,
@ID_VEICULO INT,
@ID_MECANICA INT,
@DATA VARCHAR(30),
@STATUS_OS VARCHAR(30),
@NOME_CLIENTE VARCHAR (50),
@CPF_CLIENTE VARCHAR (20),
@PLACA_CLIENTE VARCHAR (20),
@MARCA_CLIENTE VARCHAR(30),
@MODELO_CLIENTE VARCHAR(30),
@ANO_CLIENTE INT,
@NOME_MECANICA VARCHAR(50),
@NOME_DEFEITO VARCHAR(50),
@DESCRIÇÃO_DEFEITO VARCHAR (200),
@VALOR_DEFEITO VARCHAR (20),
@VALOR_MECANICA VARCHAR (20),
@VALOR_OFICINA VARCHAR (20),
@VALOR_TOTAL VARCHAR (20),
@CADASTRO VARCHAR (50)

AS
BEGIN

		INSERT INTO OS
		(
ID_CLIENTE,
ID_DEFEITO,
ID_VEICULO,
ID_MECANICA,
DATA,
STATUS_OS,
NOME_CLIENTE,
CPF_CLIENTE,
PLACA_CLIENTE,
MARCA_CLIENTE,
MODELO_CLIENTE,
ANO_CLIENTE,
NOME_MECANICA,
NOME_DEFEITO,
DESCRIÇÃO_DEFEITO,
VALOR_DEFEITO,
VALOR_MECANICA,
VALOR_OFICINA,
VALOR_TOTAL,
CADASTRO
		 )

     VALUES
	 (
           @ID_CLIENTE,
@ID_DEFEITO,
@ID_VEICULO,
@ID_MECANICA,
@DATA,
@STATUS_OS,
@NOME_CLIENTE,
@CPF_CLIENTE,
@PLACA_CLIENTE,
@MARCA_CLIENTE,
@MODELO_CLIENTE,
@ANO_CLIENTE,
@NOME_MECANICA,
@NOME_DEFEITO,
@DESCRIÇÃO_DEFEITO,
@VALOR_DEFEITO,
@VALOR_MECANICA,
@VALOR_OFICINA,
@VALOR_TOTAL,
@CADASTRO
	)

	SELECT @@IDENTITY AS Retorno
END
GO
/****** Object:  StoredProcedure [dbo].[uspUsuarioAlterar]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspUsuarioAlterar]

    @ID_USUARIO INT,
	@USUARIO VARCHAR (50),
	@SENHA VARCHAR (50),
	@NIVEL_ACESSO VARCHAR (50)
	

AS
BEGIN

UPDATE USUARIO
SET
	
           USUARIO = @USUARIO,
           SENHA = @SENHA,
           NIVEL_ACESSO = @NIVEL_ACESSO
          
WHERE

ID_USUARIO = @ID_USUARIO

SELECT @ID_USUARIO AS Retorno

END
GO
/****** Object:  StoredProcedure [dbo].[uspUsuarioConsultarPorID]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspUsuarioConsultarPorID]
@ID_USUARIO	int
AS
BEGIN

SELECT
		ID_USUARIO,
		USUARIO,
		SENHA,
		NIVEL_ACESSO

		   FROM
		   USUARIO

		   WHERE 

		   ID_USUARIO = @ID_USUARIO

		   END
GO
/****** Object:  StoredProcedure [dbo].[uspUsuarioConsultarPorNome]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspUsuarioConsultarPorNome]
@USUARIO varchar(50)
AS
BEGIN

SELECT
		ID_USUARIO,
		USUARIO,
		SENHA,
		NIVEL_ACESSO

		   FROM
		   USUARIO

		   WHERE 

		   USUARIO LIKE '%' + @USUARIO + '%'

		   END
GO
/****** Object:  StoredProcedure [dbo].[uspUsuarioExcluir]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspUsuarioExcluir]
	
	@ID_USUARIO	int

AS
BEGIN

	DELETE FROM
		USUARIO

		WHERE
		
		ID_USUARIO = @ID_USUARIO

		SELECT @ID_USUARIO AS Retorno

END
GO
/****** Object:  StoredProcedure [dbo].[uspUsuarioInserir]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspUsuarioInserir]
	
	
        @USUARIO varchar(50),
        @SENHA varchar(50),
        @NIVEL_ACESSO varchar(50)
    

AS
BEGIN

		INSERT INTO USUARIO
		(
           USUARIO,
           SENHA,
           NIVEL_ACESSO
           
		 )

     VALUES
	 (
           @USUARIO,
           @SENHA,
           @NIVEL_ACESSO
	)

	SELECT @@IDENTITY AS Retorno
END
GO
/****** Object:  StoredProcedure [dbo].[uspVeiculoAlterar]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspVeiculoAlterar]

	@ID_VEICULO INT,
	@ID_CLIENTE Int,
        @PLACA varchar(20),
        @MARCA varchar(30),
        @MODELO varchar(30),
        @ANO int,
        @COR varchar(20),
        @COMBUSTIVEL varchar(20),
		@NOME_CLIENTE varchar(50)

AS
BEGIN

UPDATE VEICULO
SET
	ID_CLIENTE = @ID_CLIENTE,
        PLACA = @PLACA,
        MARCA = @MARCA,
        MODELO = @MODELO,
        ANO = @ANO ,
        COR = @COR ,
        COMBUSTIVEL = @COMBUSTIVEL,
		NOME_CLIENTE = @NOME_CLIENTE

WHERE

ID_VEICULO = @ID_VEICULO

SELECT @ID_VEICULO AS Retorno

END
GO
/****** Object:  StoredProcedure [dbo].[uspVeiculoConsultarPorID]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspVeiculoConsultarPorID]
@ID_VEICULO	int
AS
BEGIN

SELECT
		ID_VEICULO,
		ID_CLIENTE,
         	PLACA,
           	MARCA,
           MODELO,
           ANO,
           COR,
           COMBUSTIVEL,
		   NOME_CLIENTE

		   FROM
		   VEICULO

		   WHERE 

		   ID_VEICULO = @ID_VEICULO

		   END
GO
/****** Object:  StoredProcedure [dbo].[uspVeiculoConsultarPorPlaca]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspVeiculoConsultarPorPlaca]
@PLACA varchar(20)
AS
BEGIN

SELECT
		ID_VEICULO,
		
 		ID_CLIENTE,
           PLACA,
           MARCA,
           MODELO,
           ANO,
           COR,
           COMBUSTIVEL,
		   NOME_CLIENTE

		   FROM
		   VEICULO

		   WHERE 

		   PLACA LIKE '%' + @PLACA + '%'

		   END
GO
/****** Object:  StoredProcedure [dbo].[uspVeiculoExcluir]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspVeiculoExcluir]
	
	@ID_VEICULO	int

AS
BEGIN

	DELETE FROM
		VEICULO

		WHERE
		
		ID_VEICULO = @ID_VEICULO

		SELECT @ID_VEICULO AS Retorno

END
GO
/****** Object:  StoredProcedure [dbo].[uspVeiculoInserir]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspVeiculoInserir]

		@ID_CLIENTE int,
        @PLACA varchar(20),
        @MARCA varchar(30),
        @MODELO varchar(30),
        @ANO int,
        @COR varchar(20),
        @COMBUSTIVEL varchar(20),
		@NOME_CLIENTE varchar (20)


AS
BEGIN

		INSERT INTO VEICULO
		(

		   ID_CLIENTE,
           PLACA,
           MARCA,
           MODELO,
           ANO,
           COR,
           COMBUSTIVEL,
		   NOME_CLIENTE

		 )

     VALUES
	 (
		@ID_CLIENTE,
           @PLACA,
           @MARCA,
           @MODELO,
           @ANO,
           @COR,
           @COMBUSTIVEL,
		   @NOME_CLIENTE

	)

	SELECT @@IDENTITY AS Retorno
END
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[ID_CLIENTE] [int] IDENTITY(1,1) NOT NULL,
	[NOME] [varchar](50) NOT NULL,
	[CPF] [varchar](20) NOT NULL,
	[CEP] [varchar](20) NOT NULL,
	[ENDEREÇO] [varchar](50) NULL,
	[NUMERO] [int] NULL,
	[COMPLEMENTO] [varchar](2) NULL,
	[BAIRRO] [varchar](30) NULL,
	[CIDADE] [varchar](30) NULL,
	[UF] [varchar](2) NULL,
	[TEL_RESIDENCIAL] [varchar](20) NULL,
	[TEL_CELULAR] [varchar](20) NULL,
	[EMAIL] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CLIENTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CPF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DEFEITO]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DEFEITO](
	[ID_DEFEITO] [int] IDENTITY(1,1) NOT NULL,
	[NOME_DEFEITO] [varchar](50) NULL,
	[DESCRIÇÃO] [varchar](200) NULL,
	[VALOR] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_DEFEITO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MECANICA]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MECANICA](
	[ID_MECANICA] [int] IDENTITY(1,1) NOT NULL,
	[NOME_MECANICA] [varchar](50) NOT NULL,
	[CNPJ] [varchar](20) NOT NULL,
	[CEP] [varchar](20) NOT NULL,
	[ENDEREÇO] [varchar](50) NULL,
	[NUMERO] [int] NULL,
	[COMPLEMENTO] [varchar](2) NULL,
	[BAIRRO] [varchar](30) NULL,
	[CIDADE] [varchar](30) NULL,
	[UF] [varchar](2) NULL,
	[TEL_COMERCIAL] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_MECANICA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CNPJ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OS]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OS](
	[ID_OS] [int] IDENTITY(1,1) NOT NULL,
	[ID_CLIENTE] [int] NULL,
	[ID_DEFEITO] [int] NULL,
	[ID_VEICULO] [int] NULL,
	[ID_MECANICA] [int] NULL,
	[DATA] [varchar](30) NULL,
	[STATUS_OS] [varchar](30) NULL,
	[NOME_CLIENTE] [varchar](50) NULL,
	[CPF_CLIENTE] [varchar](20) NULL,
	[PLACA_CLIENTE] [varchar](20) NULL,
	[MARCA_CLIENTE] [varchar](30) NULL,
	[MODELO_CLIENTE] [varchar](30) NULL,
	[ANO_CLIENTE] [int] NULL,
	[NOME_MECANICA] [varchar](50) NULL,
	[NOME_DEFEITO] [varchar](50) NULL,
	[DESCRIÇÃO_DEFEITO] [varchar](200) NULL,
	[VALOR_DEFEITO] [varchar](20) NULL,
	[VALOR_MECANICA] [varchar](20) NULL,
	[VALOR_OFICINA] [varchar](20) NULL,
	[VALOR_TOTAL] [varchar](20) NULL,
	[CADASTRO] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_OS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USUARIO](
	[ID_USUARIO] [int] IDENTITY(1,1) NOT NULL,
	[USUARIO] [varchar](50) NOT NULL,
	[SENHA] [varchar](50) NOT NULL,
	[NIVEL_ACESSO] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_USUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VEICULO]    Script Date: 30/10/2015 14:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VEICULO](
	[ID_VEICULO] [int] IDENTITY(1,1) NOT NULL,
	[ID_CLIENTE] [int] NULL,
	[PLACA] [varchar](20) NOT NULL,
	[MARCA] [varchar](30) NULL,
	[MODELO] [varchar](30) NULL,
	[ANO] [int] NULL,
	[COR] [varchar](20) NULL,
	[COMBUSTIVEL] [varchar](20) NULL,
	[NOME_CLIENTE] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_VEICULO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PLACA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[OS]  WITH CHECK ADD FOREIGN KEY([ID_CLIENTE])
REFERENCES [dbo].[CLIENTE] ([ID_CLIENTE])
GO
ALTER TABLE [dbo].[OS]  WITH CHECK ADD FOREIGN KEY([ID_DEFEITO])
REFERENCES [dbo].[DEFEITO] ([ID_DEFEITO])
GO
ALTER TABLE [dbo].[OS]  WITH CHECK ADD FOREIGN KEY([ID_MECANICA])
REFERENCES [dbo].[MECANICA] ([ID_MECANICA])
GO
ALTER TABLE [dbo].[OS]  WITH CHECK ADD FOREIGN KEY([ID_VEICULO])
REFERENCES [dbo].[VEICULO] ([ID_VEICULO])
GO
ALTER TABLE [dbo].[VEICULO]  WITH CHECK ADD FOREIGN KEY([ID_CLIENTE])
REFERENCES [dbo].[CLIENTE] ([ID_CLIENTE])
GO
USE [master]
GO
ALTER DATABASE [OFICINA] SET  READ_WRITE 
GO
