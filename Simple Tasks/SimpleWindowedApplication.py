import tkinter
from tkinter.constants import *
counter = [1]
def increment():
    if counter[0] == 1:
        label.configure(text =  "There has been " + str(counter[0]) + " click!")
        label.pack(fill=X, expand=2)
        counter[0] = counter[0] + 1
    else:    
        label.configure(text =  "There has been " + str(counter[0]) + " clicks!")
        label.pack(fill=X, expand=2)
        counter[0] = counter[0] + 1
    
tk = tkinter.Tk()
frame = tkinter.Frame(tk, relief=RIDGE, borderwidth=3)
frame.pack(fill=BOTH,expand=2)

label = tkinter.Label(frame, text = "There has been no clicks")
label.pack(fill=X, expand=2)

clickme = tkinter.Button(frame, text="Click Me!", command=increment)

button = tkinter.Button(frame,text="Exit",command=tk.destroy)
button.pack(side=BOTTOM)
clickme.pack(side=BOTTOM)
tk.mainloop()



''' Model answer:
from Tkinter import Tk, Label, Button
 
def update_label():
    global n
    n += 1
    l["text"] = "Number of clicks: %d" % n
 
w = Tk()
n = 0
l = Label(w, text="There have been no clicks yet")
l.pack()
Button(w, text="click me", command=update_label).pack()
w.mainloop()
'''
