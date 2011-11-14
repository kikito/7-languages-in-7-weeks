-module(translate_monitor).
-export([start/0, init/1]).
-behavior(supervisor).

start() -> supervisor:start_link(translate_monitor, []).

init(_Args) -> {
  ok, {
    { one_for_one, 1, 60 },
    [ { translate,
        { translate, start, [] },
        permanent,
        brutal_kill,
        worker,
        [translate]
      }
    ]
  }
}.

