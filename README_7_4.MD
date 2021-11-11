### devops-10 student

### HW-7.4. Средства командной работы над инфраструктурой.

---

1.</br>

[скриншот]
(http://joxi.ru/DmB5zK7tgOEvQr)[скриншот]

При явном указании секретов *aws* в *main.tf* все происходит штатно,
однако, если я указываю секреты через переменные окружения, возникает ошибка 
```NoCredentialProviders: no valid providers in chain caused by: EnvAccessKeyNotFound```