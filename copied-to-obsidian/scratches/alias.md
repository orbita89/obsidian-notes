# Aliases Cheat Sheet

## Уведомления
- **alert** – отправляет системное уведомление о результате последней команды (успех/ошибка).
```bash
alert
```


## Docker / Compose
- **dclean** – удалить все контейнеры (`docker rm -f`).
```bash
dclean
```
- **ddown** – остановить profile=magento.
```bash
ddown
```
- **ddown-elk** – остановить profile=elk.
- **ddown-mercure** – остановить profile=mercure.
- **ddown-ms** – остановить profile=ms.
- **ddown-tools** – остановить profile=tools.
- **dps** – показать запущенные контейнеры (`docker ps`).
- **drestart** – перезапустить profile=magento.
- **drm** – удалить контейнеры со статусом created/exited.
- **drmv** – удалить все docker volumes.
- **dstart** – запустить profile=magento.
- **dstop** – остановить profile=magento.
- **dup** – поднять profile=magento (`up -d`).
- **dup-elk** – поднять profile=elk (`up -d`).
- **dup-mercure** – поднять profile=mercure (`up -d`).
- **dup-ms** – поднять profile=ms (`up -d`).
- **dup-tools** – поднять profile=tools (`up -d`).
- **dup-front** – поднять фронтенд (Gusa Desktop + Mobile).

## PHP / Composer
- **composer** – запуск Composer через Docker контейнер.
- **mcc** – очистка кэша Magento (phpm).
- **mcca** – очистка кэша Magento - Admin (phpma).
- **mrh** – включить template hints (phpm).
- **mrha** – включить template hints (phpma).
- **n98a** – запуск n98-magerun (phpma).
- **n98f** – запуск n98-magerun (phpm).
- **php80..php84** – bash в контейнере PHP 8.0–8.4.
- **phpm** – bash в контейнере phpm.
- **phpma** – bash в контейнере phpma.

## Dev Tools
- **blackfire** – поднять контейнер Blackfire для профилирования PHP.
- **dyarn** – запуск Yarn через контейнер gulp-cli.
- **sok** – `optimax oauth`.
