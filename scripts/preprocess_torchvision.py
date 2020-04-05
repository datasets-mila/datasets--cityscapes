import torchvision

torchvision.datasets.Cityscapes(".", split="train", mode="fine")
torchvision.datasets.Cityscapes(".", split="test", mode="fine")
torchvision.datasets.Cityscapes(".", split="val", mode="fine")
torchvision.datasets.Cityscapes(".", split="train", mode="coarse")
torchvision.datasets.Cityscapes(".", split="train_extra", mode="coarse")
torchvision.datasets.Cityscapes(".", split="val", mode="coarse")
