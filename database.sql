
CREATE TABLE Puesto (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    SalarioxHora DECIMAL(10,2) NOT NULL
);


CREATE TABLE Usuario (
    Id INT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL
);


CREATE TABLE TipoMovimiento (
    Id INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    TipoAccion VARCHAR(10) NOT NULL
);

CREATE TABLE TipoEvento (
    Id INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Error (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Codigo INT NOT NULL UNIQUE,
    Descripcion VARCHAR(255) NOT NULL
);

CREATE TABLE Empleado (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdPuesto INT NOT NULL,
    ValorDocumentoIdentidad VARCHAR(50) NOT NULL UNIQUE,
    Nombre VARCHAR(150) NOT NULL UNIQUE,
    FechaContratacion DATE NOT NULL,
    SaldoVacaciones DECIMAL(10,2) NOT NULL DEFAULT 0,
    EsActivo BIT NOT NULL DEFAULT 1,
);

CREATE TABLE Movimiento (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdEmpleado INT NOT NULL,
    IdTipoMovimiento INT NOT NULL,
    Fecha DATE NOT NULL,
    Monto DECIMAL(10,2) NOT NULL,
    NuevoSaldo DECIMAL(10,2) NOT NULL,
    IdPostByUser INT NOT NULL,
    PostInIP VARCHAR(50) NOT NULL,
    PostTime DATETIME NOT NULL,

);

CREATE TABLE BitacoraEvento (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdTipoEvento INT NOT NULL,
    Descripcion VARCHAR(500) NULL,
    IdPostByUser INT NOT NULL,
    PostInIP VARCHAR(50) NOT NULL,
    PostTime DATETIME NOT NULL,

);

CREATE TABLE DBError (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    UserName VARCHAR(50),
    Number INT,
    State INT,
    Severity INT,
    Line INT,
    ProcedureName VARCHAR(100),
    Message VARCHAR(500),
    DateTime DATETIME DEFAULT GETDATE()
);