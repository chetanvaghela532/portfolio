# portfolio

Flutter web portfolio for Chetankumar Vaghela.

## Local commands

```bash
flutter pub get
flutter analyze
flutter build web
```

## GitHub Pages

This repo now includes a GitHub Actions workflow at `.github/workflows/deploy-pages.yml`.

What it does:
- builds the Flutter web app on every push to `main`
- sets the correct `--base-href` automatically for both `username.github.io` repos and normal project repos
- deploys the generated `build/web` output to GitHub Pages

Required GitHub setting:
- In the GitHub repository, open `Settings -> Pages`
- Set `Source` to `GitHub Actions`

Important:
- This repository's workflow token may not have permission to create the Pages site automatically.
- If the workflow fails with `Resource not accessible by integration`, enable GitHub Pages once manually in the repository settings, then rerun the workflow.

After that, every push to `main` will publish the portfolio automatically.

## Resume asset

The portfolio download link serves:

`assets/documents/resume.pdf`

Replace that file whenever you want to update the public resume without changing code.
