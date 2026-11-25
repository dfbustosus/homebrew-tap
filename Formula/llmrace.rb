class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.37.2/llmrace-v1.37.2-aarch64-apple-darwin.tar.gz"
  version "1.37.2"
  sha256 "31e814cc6d61848dbc5817e7eda8e3988da9715fd812c0c4261504b6ab185562"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.37.2/llmrace-v1.37.2-x86_64-apple-darwin.tar.gz"
    sha256 "9432733f95ee4ea740bd8585d8793a2c901f915489d80c930d5db73c49f1fbc8"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.37.2/llmrace-v1.37.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a9f96bd88662267ade8a823352c11c2c49d31f7967e384f706123ec8ae39ca22"
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
