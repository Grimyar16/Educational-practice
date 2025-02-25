CREATE TABLE PhotoStudio (
    StudioID INT PRIMARY KEY AUTO_INCREMENT,
    StudioName VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    Services TEXT,
    OpeningHours VARCHAR(50),
    Rating DECIMAL(2, 1)
);
INSERT INTO PhotoStudio (StudioName, Address, ContactNumber, Email, Services, OpeningHours, Rating)
VALUES 
('Светлая Фотостудия', 'ул. Ленина, 10', '+7 (123) 456-78-90', 'info@lightstudio.ru', 'Фотосессии, Видеосъемка', 'Пн-Пт: 10:00 - 20:00; Сб-Вс: 11:00 - 18:00', 4.8),
('Творческая Фотостудия', 'ул. Пушкина, 5', '+7 (987) 654-32-10', 'contact@creativephoto.ru', 'Фотосессии, Обработка фото', 'Пн-Пт: 09:00 - 19:00; Сб: 10:00 - 16:00', 4.5);
