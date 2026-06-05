# Panduan Docker untuk metpen-ai-lab

## Prasyarat

- Docker Desktop sudah terinstal dan berjalan
- Port 8891 tersedia (tidak digunakan container lain)

## Cara Menjalankan

### Opsi 1: Menggunakan Docker Compose (Recommended)

1. Buka terminal/PowerShell di folder `metpen-ai-lab`
2. Jalankan perintah:
   ```bash
   docker-compose up -d
   ```
3. Tunggu hingga build dan container berjalan
4. Akses Jupyter Lab di browser: http://localhost:8891
5. Untuk melihat log:
   ```bash
   docker-compose logs -f
   ```
6. Untuk menghentikan:
   ```bash
   docker-compose down
   ```

### Opsi 2: Menggunakan Docker Manual

1. Build image:
   ```bash
   docker build -t metpen-ai-lab .
   ```
2. Jalankan container:
   ```bash
   docker run -d \
     --name metpen-ai-lab-container \
     -p 8891:8891 \
     -v ${PWD}:/workspace \
     metpen-ai-lab
   ```
3. Akses Jupyter Lab di: http://localhost:8891

## Konfigurasi Port

- **Port Host**: 8891 (port di komputer Anda)
- **Port Container**: 8891 (port di dalam Docker)
- Port ini dipilih untuk menghindari konflik dengan container lain yang mungkin menggunakan port default Jupyter (8888)

## Mengganti Port (Jika Masih Konflik)

Jika port 8891 masih bermasalah, edit file `docker-compose.yml`:

```yaml
ports:
  - "8892:8891" # Ganti 8892 dengan port lain yang tersedia
```

Kemudian restart container:

```bash
docker-compose down
docker-compose up -d
```

## Troubleshooting

### Port sudah digunakan

Jika muncul error "port is already allocated":

1. Cek container yang menggunakan port tersebut:
   ```bash
   docker ps
   ```
2. Ganti port di `docker-compose.yml` seperti dijelaskan di atas

### Container tidak bisa start

1. Lihat log error:
   ```bash
   docker-compose logs
   ```
2. Pastikan Docker Desktop berjalan
3. Restart Docker Desktop jika perlu

### File tidak tersinkronisasi

- Pastikan volume mounting sudah benar di `docker-compose.yml`
- Restart container: `docker-compose restart`

## Perintah Berguna

```bash
# Melihat container yang berjalan
docker ps

# Melihat semua container (termasuk yang stopped)
docker ps -a

# Masuk ke dalam container
docker exec -it metpen-ai-lab-container /bin/bash

# Melihat log real-time
docker-compose logs -f

# Rebuild image setelah perubahan
docker-compose up -d --build

# Menghapus container dan volume (HATI-HATI!)
docker-compose down -v
```

## Catatan Keamanan

- Container ini dijalankan **tanpa password** untuk kemudahan pengembangan lokal
- **JANGAN** expose port ini ke internet atau jaringan publik
- Hanya gunakan untuk pengembangan lokal di komputer Anda sendiri
