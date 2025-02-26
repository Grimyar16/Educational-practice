-- Таблица "Должность"
CREATE TABLE Должность (
    Должность_ID INT PRIMARY KEY,
    Должность VARCHAR(255)
);

-- Таблица "Сотрудник"
CREATE TABLE Сотрудник (
    Сотрудник_ID INT PRIMARY KEY,
    ID_Офиса INT,
    Должность_ID INT,
    ФИО VARCHAR(255),
    Паспортные_данные TEXT,
    Фотография BLOB,
    FOREIGN KEY (ID_Офиса) REFERENCES Офис(ID_Офиса),
    FOREIGN KEY (Должность_ID) REFERENCES Должность(Должность_ID)
);

-- Таблица "Офис"
CREATE TABLE Офис (
    ID_Офиса INT PRIMARY KEY,
    Название_офиса VARCHAR(255),
    Адрес_офиса VARCHAR(255),
    Фотостудия_ID INT,
    Сотрудник_ID INT,
    FOREIGN KEY (Фотостудия_ID) REFERENCES Фотостудия(Фотостудия_ID),
    FOREIGN KEY (Сотрудник_ID) REFERENCES Сотрудник(Сотрудник_ID)
);

-- Таблица "Фотостудия"
CREATE TABLE Фотостудия (
    Фотостудия_ID INT PRIMARY KEY,
    ID_Офиса INT,
    Название_фотостудии VARCHAR(255),
    Адрес_фотостудии VARCHAR(255),
    -- Заказ_ID INT,  -- Вероятно, неверная связь.  Закомментировано.
    FOREIGN KEY (ID_Офиса) REFERENCES Офис(ID_Офиса)
    -- FOREIGN KEY (Заказ_ID) REFERENCES Заказ(Заказ_ID) -- Закомментировано
);

-- Таблица "Клиент"
CREATE TABLE Клиент (
    Клиент_ID INT PRIMARY KEY,
    ФИО VARCHAR(255),
    Телефон VARCHAR(20),
    Депозитная_карта VARCHAR(255),
    Статус VARCHAR(50)
);

-- Таблица "Цена"
CREATE TABLE Цена (
    Цена_ID INT PRIMARY KEY,
    Параметр VARCHAR(255),
    Цена DECIMAL(10, 2)
);

-- Таблица "Услуги"
CREATE TABLE Услуги (
    Услуги_ID INT PRIMARY KEY,
    Цена_ID INT,
    Заказ_ID INT,
    Дата DATE,
    Вид VARCHAR(255),
    Цена DECIMAL(10, 2), -- Возможно, избыточно.
    FOREIGN KEY (Цена_ID) REFERENCES Цена(Цена_ID),
    FOREIGN KEY (Заказ_ID) REFERENCES Заказ(Заказ_ID)
);

-- Таблица "Заказ"
CREATE TABLE Заказ (
    Заказ_ID INT PRIMARY KEY,
    Клиент_ID INT,
    Услуги_ID INT,
    Тип_заказа VARCHAR(255),
    Срочность VARCHAR(50),
    Фотостудия_ID INT,
    Оборудование_ID INT,
    FOREIGN KEY (Клиент_ID) REFERENCES Клиент(Клиент_ID),
    FOREIGN KEY (Услуги_ID) REFERENCES Услуги(Услуги_ID),
    FOREIGN KEY (Фотостудия_ID) REFERENCES Фотостудия(Фотостудия_ID),
    FOREIGN KEY (Оборудование_ID) REFERENCES Оборудование(Оборудование_ID)
);

-- Таблица "Оборудование"
CREATE TABLE Оборудование (
    Оборудование_ID INT PRIMARY KEY,
    Заказ_ID INT,
    Тип_оборудования VARCHAR(255),
    Количество INT,
    Склад_ID INT,
    FOREIGN KEY (Заказ_ID) REFERENCES Заказ(Заказ_ID),
    FOREIGN KEY (Склад_ID) REFERENCES Склад(Склад_ID)
);

-- Таблица "Склад"
CREATE TABLE Склад (
    Склад_ID INT PRIMARY KEY,
    Оборудование_ID INT,
    Адрес VARCHAR(255),
    FOREIGN KEY (Оборудование_ID) REFERENCES Оборудование(Оборудование_ID)
);
