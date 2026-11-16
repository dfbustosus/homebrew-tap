class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.3.2/llmrace-v1.3.2-aarch64-apple-darwin.tar.gz"
  version "1.3.2"
  sha256 "add1e536ad45d83a3603612f269d087c82ee7fcac47879388e4ca27a190a0877"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.3.2/llmrace-v1.3.2-x86_64-apple-darwin.tar.gz"
    sha256 "bb72f26c29c46614208391d7833603462125f73d5d302d00ef49a119ebb9f95c"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.3.2/llmrace-v1.3.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d7fa23fc381e1b4d457b4eac69be92ee1f341702043ae5d676526e66820f7e99"
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
