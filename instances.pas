// -== Check to see if the named mutex object existed before this call ==-
MutexHandle := CreateMutex(nil, TRUE, 'SMSServer_APP');
if MutexHandle <> 0 then begin
  if GetLastError = ERROR_ALREADY_EXISTS then begin
    // -== set hPrevInst property and close the mutex handle ==-
    MessageBox(0, 'Una Instancia de la aplicación ya esta ejecutándose', 'Error', mb_IconHand);
    hPrevInst := TRUE;
    CloseHandle(MutexHandle);
    Halt; // 'Halt' Is the actual one that prevents a second instance of your app from running.
  end else begin
    // -== indicate no previous instance was found ==-
    hPrevInst := FALSE;
  end;
end else begin
  // -== indicate no previous instance was found ==-
  hPrevInst := FALSE;
end;
