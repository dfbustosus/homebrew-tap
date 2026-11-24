class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.29.0/llmrace-v1.29.0-aarch64-apple-darwin.tar.gz"
  version "1.29.0"
  sha256 "0067e2bb15254e2091ebb67b56b5d60b7ce8e3e2b904adbfee8e521eb7c11ba1"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.29.0/llmrace-v1.29.0-x86_64-apple-darwin.tar.gz"
    sha256 "fbea6da65fd040d845060064c36a8abe509634155e1420dcc9fefc811d47e0d6"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.29.0/llmrace-v1.29.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ff1e893dadcae1d55823ff713753f8580b66a8c95e15fc2fb022e0f642b1b679"
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
