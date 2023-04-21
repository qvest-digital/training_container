# training_docker

http://localhost:8123/slides.md#/

```bash
docker network inspect bridge --format='{{json .IPAM.Config }}' | jq .[].Gateway
```

sudo usermod --add-subuids 200000-201000 --add-subgids 200000-201000 USER