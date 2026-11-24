class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.34.0/llmrace-v1.34.0-aarch64-apple-darwin.tar.gz"
  version "1.34.0"
  sha256 "3ed885cbb5fa386eec8b448f2a254f53b27ed12f4cb116717f5a84a28ee8c739"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.34.0/llmrace-v1.34.0-x86_64-apple-darwin.tar.gz"
    sha256 "882a202f2a9490acc0374f80460670c37b0600175d63b210d1401b9e8543a82c"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.34.0/llmrace-v1.34.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f5fd7c1b4e1af88f2c7a290e2a08bfb41d11c86493fe475920ca17ff262a4cc2"
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
