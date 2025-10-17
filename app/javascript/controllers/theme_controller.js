import { Controller } from "@hotwired/stimulus"

export default class ThemeController extends Controller {
  static targets = ["toggle"]

  connect() {
    this.initializeTheme()
  }

  initializeTheme() {
    const theme = localStorage.getItem("theme-kofego") || (matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light")
    document.documentElement.setAttribute("data-theme", theme)
    localStorage.setItem("theme-kofego", theme)

    if (this.hasToggleTarget) {
      this.toggleTarget.checked = theme === "dark"
    }
  }

  toggle(e) {
    const theme = e.target.checked ? "dark" : "light"
    document.documentElement.setAttribute("data-theme", theme)
    localStorage.setItem("theme-kofego", theme)
  }
}

