# Repo Template

This repository serves as a modern, feature-rich template for Python projects. It is designed to help you start new projects quickly with best practices, automation, and developer tooling already in place.

## Features

- **GitHub Copilot Integration**: Ready for AI-powered code completion and suggestions.
- **Pre-configured GitHub Workflows**: Automated CI/CD pipelines for testing, linting, and more.
- **VS Code Customizations**: Includes recommended extensions and settings for a productive development environment.
- **uv Environment Management**: Uses [uv](https://github.com/astral-sh/uv) for fast, reliable Python dependency management and virtual environments.
- **Best Practices**: Clean code, DRY principles, and no hardcoded secrets.

## Getting Started

1. **Clone the repository:**
	```zsh
	git clone <your-repo-url>
	cd repo_template
    uv sync
	```

2. **Set up your Python environment with uv:**
	```zsh
	uv venv
	source .venv/bin/activate
	uv pip install -r requirements.txt  # if requirements.txt exists
	```

3. **Configure environment variables:**
	- Copy `.env.example` to `.env` and fill in the required values.

4. **Open in VS Code:**
	- Recommended extensions and settings will be suggested automatically.

5. **Start developing!**

## Using This Template for Your Own Project


### Quick Start: Create Your Own Project from This Template

This repo includes a script to automate the process of copying the template, removing git history, and setting up a new project directory.

#### 1. Run the script

From the root of this template repository, run:

```zsh
chmod +x template_to_my_new_repo.sh
./template_to_my_new_repo.sh <new_project_name> [<remote_repo_url>]
```

- `<new_project_name>`: The name of your new project directory.
- `[<remote_repo_url>]`: (Optional) The URL of your new GitHub repository. If omitted, the repo will be local only.

#### 2. Update project details

- Edit `pyproject.toml`, `README.md`, and other files as needed for your project.
- Replace placeholder values in `.env` and other config files. 

#### 3. (Optional) Push to GitHub

If you provided a remote URL, you can push your new project:

```zsh
git push -u origin main
```

You now have a fresh project based on this template, ready for development!

## Project Structure

- `main.py` — Entry point for your application.
- `pyproject.toml` — Project metadata and dependencies.
- `.github/` — GitHub Actions workflows and repository instructions.
- `.vscode/` — VS Code settings and recommendations.
- `.env.example` — Example environment variables file.