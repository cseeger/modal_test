defmodule ModalTestWeb.PageLive do
  use ModalTestWeb, :live_view
  require Logger

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, first_phase: true, second_phase: false)}
  end

  @impl true
  def handle_event("transition_to_second_phase", _, socket) do
    Logger.info("transition_to_second_phase")
    {:noreply, assign(socket, first_phase: false, second_phase: true)}
  end

  @impl true
  def handle_event("reset_phase", _, socket) do
    Logger.info("reset_phase")
    {:noreply, assign(socket, first_phase: true, second_phase: false)}
  end
end
