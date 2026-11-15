class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.1.0/llmrace-v1.1.0-aarch64-apple-darwin.tar.gz"
  version "1.1.0"
  sha256 "28d8c58b7a066eff42cfdd66e11ee91b8ab236b6a40bc4a22ad1207e22e97bb9"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.1.0/llmrace-v1.1.0-x86_64-apple-darwin.tar.gz"
    sha256 "d5aac8cfc73a6cb147fee8135ee01ca207917e8926fdd7675d7052bc8989d17f"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.1.0/llmrace-v1.1.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ffc7c0db003cd55e6ffbb0c29dc4ded36673c9125695bb31ce8fc16c2508aa05"
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
