class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.25.0/llmrace-v1.25.0-aarch64-apple-darwin.tar.gz"
  version "1.25.0"
  sha256 "a3a3f0f54bfc016a4ebe981492a32804474c387671c7766061c3679f356a5ed1"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.25.0/llmrace-v1.25.0-x86_64-apple-darwin.tar.gz"
    sha256 "c3d9e1df0129005a992e20f155a7ee2e057423e388ebaae9079cd9b9bb620686"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.25.0/llmrace-v1.25.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c4f24d255454c85eedbaeb4bcd836a7e80b19a6cb11fba5cc7c1bd294a33179c"
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
