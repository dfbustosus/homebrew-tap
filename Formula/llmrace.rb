class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.3.0/llmrace-v1.3.0-aarch64-apple-darwin.tar.gz"
  version "1.3.0"
  sha256 "45c619ecdf0b34bf759566d9559abf89010e4691d9fc65c6f232475f701fce2c"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.3.0/llmrace-v1.3.0-x86_64-apple-darwin.tar.gz"
    sha256 "9b83419cf874c001edf53d2e192b14ad4564d73bc6ad2b840bc582c66d237ebd"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.3.0/llmrace-v1.3.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "38487f6423d893ccd587cf8ca77fdcb5bf5900a0abdb6ce0bef08f15c208a17f"
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
