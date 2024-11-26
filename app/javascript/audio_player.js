// ontimeupdate イベントで再生位置と秒数を更新
audio.ontimeupdate = () => {
  if (audio.duration) {
    // シークバーの値を更新
    seekBar.value = (audio.currentTime / audio.duration) * 100;
    // 現在の秒数をフォーマットして表示
    currentTimeDisplay.textContent = formatTime(audio.currentTime);
  }
};

// シークバーを手動で変更したときの処理
seekBar.oninput = () => {
  if (audio.duration) {
    audio.currentTime = (seekBar.value / 100) * audio.duration;
  }
};

// 音量調整の処理
volumeBar.oninput = () => {
  audio.volume = volumeBar.value; // volume は 0 ~ 1 の範囲
};
;
;

// 時間を「分:秒」形式にフォーマットする関数
function formatTime(seconds) {
const minutes = Math.floor(seconds / 60);
const remainingSeconds = Math.floor(seconds % 60);
return `${minutes}:${remainingSeconds.toString().padStart(2, '0')}`;
}