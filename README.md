# IdeaPadTech — Official Web Portal & OmniBoot OTG Hub

Welcome to **IdeaPadTech**, a web application tailored for deployment on **Vercel**.

## 📑 Website Structure
The website features 3 tabs:
1. **Home**: Company vision, core technology overview, and feature breakdown of the OmniBoot OTG engine.
2. **Downloads**: Central repository for downloading binaries, technical specs, installation instructions (Phone vs ADB), and cryptographic checksums.
3. **Deployments**: Live Vercel build telemetry, Edge network status, and a **direct download section for the installable `OmniBoot-v1.0.apk`**.

---

## 📦 Bundled Downloadable Artifacts
* [`OmniBoot-v1.0.apk`](file:///C:/Users/Tilak/.gemini/antigravity/scratch/ideapadtech/OmniBoot-v1.0.apk) — Size: 24.5 KB
* SHA-256 Checksum: `9EFFFFA71FCF06BED99A7F68A920D4E220AF4CF401E963457E01E80B5A05997E`
* Download route: `https://<your-project>.vercel.app/OmniBoot-v1.0.apk`

---

## 🚀 How to Deploy to Vercel

### Option 1: Using the Vercel CLI (Fastest)
From PowerShell / Terminal:
```bash
cd C:\Users\Tilak\.gemini\antigravity\scratch\ideapadtech
npx vercel
```
* Follow the prompts:
  * Set up and deploy `C:\Users\Tilak\.gemini\antigravity\scratch\ideapadtech`? **y**
  * Which scope do you want to deploy to? *(select your account)*
  * Link to existing project? **N**
  * What's your project's name? **ideapadtech**
  * In which directory is your code located? **.**
* For production deployment:
```bash
npx vercel --prod
```

### Option 2: Using GitHub & Vercel Dashboard
1. Initialize a git repository and push to GitHub:
   ```bash
   cd C:\Users\Tilak\.gemini\antigravity\scratch\ideapadtech
   git init
   git add .
   git commit -m "Initial commit for IdeaPadTech"
   git remote add origin https://github.com/<your-username>/ideapadtech.git
   git push -u origin main
   ```
2. Log into [vercel.com](https://vercel.com).
3. Click **Add New > Project**, select the `ideapadtech` repository, and click **Deploy**.
4. Vercel will automatically read `vercel.json` and deploy the website to `https://ideapadtech.vercel.app`!
