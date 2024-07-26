# SearchApp
Данное приложение разработано для поиска изображений по ключевым словам, используя API Pexels.com

Программа разработана на Swift 5 c использованием SwiftUI

# Преимущества приложения
1. Работа с сетью реализована без использования сторонних библиотек, с применением built-in URLSession, что позволяет избегать дополнительных зависимостей от сторонних разработок
2. Имплементирован паттер MVVM, в приложении полностью отделена бизнес-логика от представления
3. Для работы с api был разработан отдельный сервис-класс. Гарантирована безопасная масштабируемость приложения и переиспользование кода взаимодействия с API
4. Применены технологии асинхронной загрузки изображения и масштабируемости количества изображений на экране в зависимости от размера устройства
5. Проработан механизм загрузки изображений, он плавен, все изображения загружаются последовательно и без торможений
6. Обеспечена фоновая подгрузка следующих изображений при достижении конца списка

# Приложение тестировалось на Iphone 15 simulator (iOS 17.2), Ipad 10th generation simulator (iOS 17.2) и Iphone 13 (iOS 17.4.1)

<img width="331" alt="Снимок экрана 2024-07-26 в 16 48 47" src="https://github.com/user-attachments/assets/70ce196e-d44a-4520-8609-92e36b132265">
<img width="344" alt="Снимок экрана 2024-07-26 в 16 49 25" src="https://github.com/user-attachments/assets/13acd8b7-6990-4fee-b6a0-c363ec63bc15">
<img width="492" alt="Снимок экрана 2024-07-26 в 17 11 03" src="https://github.com/user-attachments/assets/af5325dc-101f-4d44-91cb-078ceaa3f3be">
