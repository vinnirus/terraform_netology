### devops-10 student

### HW-7.4. Средства командной работы над инфраструктурой.

---

1.</br>

[скриншот](http://joxi.ru/DmB5zK7tgOEvQr)

При явном указании секретов *aws* в *main.tf* все происходит штатно,
однако, если я указываю секреты через переменные окружения, возникает ошибка 
```NoCredentialProviders: no valid providers in chain caused by: EnvAccessKeyNotFound```

2.</br>
Файлы *server.yaml* и *atlantis.yaml* находятся в этом же репозитории.

3.</br>

```
module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.12.0"

  name           = "my_debian"
  instance_count = 2

  ami                    = "ami-0c7ea5497c02abcaf"
  instance_type          = "t2.micro"

  subnet_id = "vinnirus_subnet"

  tags = {
    name  = "netology_vinnirus_aws_debian"
    owner = "Nikita Vinogradov"
  }
}
```