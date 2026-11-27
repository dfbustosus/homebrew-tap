class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.40.0/llmrace-v1.40.0-aarch64-apple-darwin.tar.gz"
  version "1.40.0"
  sha256 "1b8ce3a1799bf8ce858d06ad13b9f89f12287357220011729d5a6bffe1f0820d"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.40.0/llmrace-v1.40.0-x86_64-apple-darwin.tar.gz"
    sha256 "f01ee97a211ea9a92de68e9ac62e52a4c0d253e2cc4a5e3d1a909ce01c6328da"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.40.0/llmrace-v1.40.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "50b1ae99bbe1dbb8f3e15d65e53396c5aa495f669e4beb614c272a56a6667ef2"
  end

  def install
    bin.install "bin/llmrace"
  end

  def caveats
    <<~EOS
      Providers are auto-detected from the environment:
      OPENAI_API_KEY, ANTHROPIC_API_KEY, GEMINI_API_KEY, GROQ_API_KEY,
      DEEPSEEK_API_KEY, MISTRAL_API_KEY, TOGETHER_API_KEY, FIREWORKS_API_KEY,
      CEREBRAS_API_KEY, OPENROUTER_API_KEY, or a local Ollama daemon.
    EOS
  end

  test do
    assert_match "llmrace", shell_output("#{bin}/llmrace --version")
  end
end
