# 🗺️ AdventureLog Roadmap

This document outlines the planned features, infrastructure improvements, and development milestones for the **AdventureLog** project.

---

## 🛠️ Immediate Focus (Short Term)

### 🗺️ Geospatial & Maps
- [ ] **Custom Map Styles**: Implement terrain and satellite view options in the frontend.
- [ ] **Location Tagging**: Enhance the point-of-interest (POI) selection logic.

### 📧 System Communications
- [ ] **Email SMTP Testing**: Verify the Gmail SMTP configuration for system notifications and password resets.
- [ ] **Newsletter/Update system**: Setup a simple way to notify users of new adventure logs.

---

## 🚀 Planned Enhancements (Medium Term)

### 🏃 External Integrations
- [ ] **Strava Sync**: Implement the Strava API integration to automatically import activities into logs.
- [ ] **GPX/KML Support**: Enable bulk upload of track files for route visualization.

### 📊 Analytics & Insights
- [ ] **Umami Integration**: Deploy and configure Umami for privacy-focused usage analytics.
- [ ] **Adventure Statistics**: Add a dashboard showing total distance, elevation gain, and time spent on adventures.

### 🔐 Security & Access
- [ ] **Social Authentication**: Configure Google/GitHub OAuth for easier login.
- [ ] **Privacy Controls**: Implement per-adventure privacy settings (Private, Shared via Link, Public).

---

## 🔮 Long-Term Vision

- [ ] **Mobile PWA**: Optimize the frontend as a Progressive Web App for offline log creation during trips.
- [ ] **Media Optimization**: Implement automatic image resizing and WebP conversion for faster load times.
- [ ] **Collaborative Adventures**: Allow multiple users to contribute to a single shared adventure log.

---

## 🏗️ Infrastructure & Maintenance

- [ ] **Backup Automation**: Create a script using `docker exec` + `pg_dump` to periodically backup the PostGIS database from the `postgres_data` named volume.
- [ ] **CI/CD Pipeline**: Setup GitHub Actions for automated linting and container building.
- [ ] **Documentation**: Expand the local documentation for advanced configuration.

---

## 🐛 Bug Fixing

- [ ] **Google Maps**: Verify API key is correctly set in `.env` and restricted; investigate and resolve any connectivity/validation errors in the frontend container.
- [ ] **CORS/CSRF Configuration**: Verify and fix any cross-origin errors between frontend (`:8015`) and backend (`:8016`).
- [ ] **Volume Persistence**: Ensure database data correctly persists across container restarts and updates.

---

## ✅ Completed Recently

- [x] Initial containerized setup with **OrbStack**.
- [x] **PostGIS** database integration for geospatial data.
- [x] Basic environment configuration (`.env`).
- [x] Deployment of Frontend and Backend services.
