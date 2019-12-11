      filename="/home/tuoms/C++/Neural_networks/Test_proj/NN_simple/accuracy.txt"
      epochs=1:30
      nn_accuracy=read.table(filename, header=FALSE, sep="\n", dec=".")
      
      plot(epochs, unlist(nn_accuracy), type="o", col="red", axes=FALSE, ylab="accuracy %",
           main="--")
      axis(1, at=epochs)
      axis(2, at=0:100)
  