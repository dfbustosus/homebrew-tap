class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.23.0/llmrace-v1.23.0-aarch64-apple-darwin.tar.gz"
  version "1.23.0"
  sha256 "ae6f6f80bcbdeb9fd68115908e161a69e05f547fcd917a9813f16af032b529da"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.23.0/llmrace-v1.23.0-x86_64-apple-darwin.tar.gz"
    sha256 "d76bab9e1a875445fea98136ec8cd50d1f981959ecd4e0b00a196d21cbb236a4"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.23.0/llmrace-v1.23.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d195ac90fe37919d5b58a25db50658f0d29f247970f88e1ac7b9c5445adc9b1a"
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
