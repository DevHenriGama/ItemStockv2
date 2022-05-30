object ApiData: TApiData
  Height = 381
  Width = 425
  object EventsMain: TDWServerEvents
    IgnoreInvalidParams = False
    Events = <
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'status'
        EventName = 'status'
        OnlyPreDefinedParams = False
        OnReplyEvent = EventsMainEventsstatusReplyEvent
      end>
    Left = 208
    Top = 192
  end
end
