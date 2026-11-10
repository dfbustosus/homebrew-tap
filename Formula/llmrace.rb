class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v0.5.0/llmrace-v0.5.0-aarch64-apple-darwin.tar.gz"
  version "0.5.0"
  sha256 "92ccd69cdcab262e92bba630bf817bb9e1f6ecd97a4c6a7b309cba4966544a56"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v0.5.0/llmrace-v0.5.0-x86_64-apple-darwin.tar.gz"
    sha256 "9d66a6d3447b73bb55b19a84348b423665e02ed65ad0b62f28197a46afbaea12"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v0.5.0/llmrace-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6038b90910e0fbb2580b90b7d775076202414f90af5cf0eeb4c0a439fcdaaea4"
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
