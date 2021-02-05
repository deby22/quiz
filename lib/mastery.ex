defmodule Mastery do
  alias Mastery.Boundary.{QuizSession, QuizManager, Proctor}
  alias Mastery.Boundary.{TemplateValidator, QuizValidator}
  alias Mastery.Core.Quiz
  @persistence_fn Application.get_env(:mastery, :persistence_fn)

  def build_quiz(fields) do
    with :ok <- QuizValidator.errors(fields),
         :ok <- GenServer.call(QuizManager, {:build_quiz, fields}),
         do: :ok,
         else: (error -> error)
  end

  def schedule_quiz(quiz, templates, start_at, end_at) do
    with :ok <- QuizValidator.errors(quiz),
         true <- Enum.all?(templates, &(:ok == TemplateValidator.errors(&1))),
         :ok <- Proctor.schedule_quiz(quiz, templates, start_at, end_at),
         do: :ok,
         else: (error -> error)
  end

  def add_template(title, fields) do
    with :ok <- TemplateValidator.errors(fields),
         :ok <- GenServer.call(QuizManager, {:add_template, title, fields}),
         do: :ok,
         else: (error -> error)
  end

  def take_quiz(title, email) do
    with %Quiz{} = quiz <- QuizManager.lookup_quiz_by_title(title),
         {:ok, _} <- QuizSession.take_quiz(quiz, email) do
      {title, email}
    else
      error -> error
    end
  end

  def select_question(session) do
    QuizSession.select_question(session)
    # GenServer.call(QuizSession.via(session), :select_question)
  end

  # def answer_question(session, answer) do
  #   QuizSession.answer_question(session, answer)
  #   # GenServer.call(session, {:answer_question, answer})
  # end
  #  Czyli miałem rację. Przy zmianie wchodzimy w QuizSession zamiast GenServer
  def answer_question(name, answer, persistence_fn \\ @persistence_fn) do
    QuizSession.answer_question(name, answer, persistence_fn)
  end
end
