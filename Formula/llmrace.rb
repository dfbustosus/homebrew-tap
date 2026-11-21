class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.14.0/llmrace-v1.14.0-aarch64-apple-darwin.tar.gz"
  version "1.14.0"
  sha256 "232b0e8b5e76127dac0c2a280889c1c48c964795f99759c202e19b60ec52acf3"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.14.0/llmrace-v1.14.0-x86_64-apple-darwin.tar.gz"
    sha256 "c3b0dcbca2108b4482393fcbe6d4b0a505ed8ab2ad2e16a20c3dbeb7df028216"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.14.0/llmrace-v1.14.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dff7051234c5ac685f85a44d43c7feb2ae5197489c6215a3711f93b7093abcb1"
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
