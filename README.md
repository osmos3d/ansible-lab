# Ansible Lab: три контейнера

`controller` — контейнер с Ansible, `node1` и `node2` — управляемые Ubuntu по SSH. Всё запускается через Docker Compose. SSH-ключи создаются при первом запуске. Никаких портов на хосте не публикуется. Используется root-доступ по SSH *только для локальной учебной лаборатории*.

## Требования

- Docker Engine с Compose v2 или Docker Desktop (с Linux containers).
- Интернет для скачивания базовых образов и Python-пакета Ansible при первой сборке.

Проверить: `docker --version` и `docker compose version`.

## Запуск

В каталоге, где находится `compose.yaml`:

```sh
docker compose up -d --build
docker compose ps
docker compose exec controller sh
```

В открытом терминале контейнера `controller`:

```sh
ansible --version
ansible-inventory --graph
ansible servers -m ping
ansible-playbook 01-hello.yml
ansible servers -m command -a 'cat /tmp/hello-from-ansible.txt'
```

Если `ping` запускался сразу после старта, а SSH ещё не готов: повторить команду через несколько секунд.

Выход из контроллера: `exit`.

## Как продолжать обучение

Создавайте `playbooks/02-...yml` на своём компьютере, они доступны в `/workspace` контроллера. Начать можно с команд `ansible servers -m command -a 'hostname'`, `ansible node1 -m ping`, `ansible-playbook 01-hello.yml --check`.

## Управление лабораторией

```sh
docker compose stop           # остановить
docker compose start          # запустить заново
docker compose down           # удалить контейнеры, сохранить ключи/файлы
docker compose down -v        # удалить также том с SSH-ключами
```

**Важно:** Это контейнеры, не полноценные виртуальные машины. Для уроков, использующих `systemd`, `reboot` или управление ядром, позже понадобятся виртуальные машины или другой специализированный образ.
