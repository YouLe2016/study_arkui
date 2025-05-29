export class ColorUtils {
  private constructor() {
  }

  static getRandomColor(alpha: number = 0.3): string {
    const randomR = Math.floor(Math.random() * 256)
    const randomG = Math.floor(Math.random() * 256)
    const randomB = Math.floor(Math.random() * 256)
    return `rgba(${randomR},${randomG}, ${randomB}, ${alpha})`
  }
}