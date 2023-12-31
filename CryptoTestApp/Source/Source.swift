//
//  Source.swift
//  CryptoTestApp
//
//  Created by Artem on 20.10.2023.
//

import Foundation

enum Source {
    static let htmlString = """
<!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container" style="height:100%;width:100%">
  <div id="tradingview_3e8f5" style="height:calc(90% - 32px);width:100%"></div>
  <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
  <script type="text/javascript">
  new TradingView.widget(
  {
  "autosize": true,
  "symbol": "BINANCE:BUSDRUB",
  "interval": "D",
  "timezone": "Etc/UTC",
  "theme": "dark",
  "style": "1",
  "locale": "en",
  "enable_publishing": false,
  "backgroundColor": "rgba(28, 31, 45, 1)",
  "gridColor": "rgba(66, 66, 66, 0.56)",
  "hide_top_toolbar": true,
  "hide_legend": true,
  "save_image": false,
  "hide_volume": true,
  "container_id": "tradingview_3e8f5"
}
  );
  </script>
</div>
<!-- TradingView Widget END -->
"""
    
    static let htmlString2 = """
<!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container" style="height:100%;width:100%">
  <div id="tradingview_ef814" style="height:calc(80% - 32px);width:100%"></div>
  <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
  <script type="text/javascript">
  new TradingView.widget(
  {
  "autosize": true,
  "symbol": "FOREXCOM:EURUSD",
  "interval": "D",
  "timezone": "Etc/UTC",
  "theme": "dark",
  "style": "1",
  "locale": "en",
  "enable_publishing": false,
  "backgroundColor": "rgba(28, 31, 45, 1)",
  "gridColor": "rgba(66, 66, 66, 0.56)",
  "hide_top_toolbar": true,
  "hide_legend": true,
  "container_id": "tradingview_ef814"
}
  );
  </script>
</div>
<!-- TradingView Widget END -->
"""
}
