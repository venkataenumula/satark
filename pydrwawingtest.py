import plt

# Recreate and display the line diagrams for the lower and upper support platforms

fig, axs = plt.subplots(1, 2, figsize=(12, 6))
axs[0].set_title("Lower Support Platform Design", fontsize=10)
axs[1].set_title("Upper Support Platform Design", fontsize=10)

# Coordinates for trapezoidal shape
lower_coords = [[1, 1], [6, 1], [5, 4], [2, 4]]
upper_coords = [[1, 1], [6, 1], [5, 4], [2, 4]]

# Adding trapezoidal shape to both platforms
for i, coords in enumerate([lower_coords, upper_coords]):
    trapezoid = patches.Polygon(coords, closed=True, edgecolor='blue', facecolor='none', linewidth=2)
    axs[i].add_patch(trapezoid)
    axs[i].set_xlim(0, 7)
    axs[i].set_ylim(0, 5)
    axs[i].axis('off')

    # Add mounting points markers and annotations
    axs[i].plot(3.5, 0.5, 'ro')  # Generator or central blade mount
    axs[i].annotate("Central Mount (Generator/Blades)", (3.5, 0.5), textcoords="offset points", xytext=(0, -20), ha='center', color='red')

    # Pole mounts
    axs[i].plot(1.5, 3.5, 'go')  # Left pole mount
    axs[i].plot(4.5, 3.5, 'go')  # Right pole mount
    axs[i].annotate("Left Pole Mount", (1.5, 3.5), textcoords="offset points", xytext=(-15, 10), ha='center', color='green')
    axs[i].annotate("Right Pole Mount", (4.5, 3.5), textcoords="offset points", xytext=(15, 10), ha='center', color='green')

plt.tight_layout()
plt.show()



# Recreate and display the line diagrams for the lower and upper support platforms

fig, axs = plt.subplots(1, 2, figsize=(12, 6))
axs[0].set_title("Lower Support Platform Design", fontsize=10)
axs[1].set_title("Upper Support Platform Design", fontsize=10)

# Coordinates for trapezoidal shape
lower_coords = [[1, 1], [6, 1], [5, 4], [2, 4]]
upper_coords = [[1, 1], [6, 1], [5, 4], [2, 4]]

# Adding trapezoidal shape to both platforms
for i, coords in enumerate([lower_coords, upper_coords]):
    trapezoid = patches.Polygon(coords, closed=True, edgecolor='blue', facecolor='none', linewidth=2)
    axs[i].add_patch(trapezoid)
    axs[i].set_xlim(0, 7)
    axs[i].set_ylim(0, 5)
    axs[i].axis('off')

    # Add mounting points markers and annotations
    axs[i].plot(3.5, 0.5, 'ro')  # Generator or central blade mount
    axs[i].annotate("Central Mount (Generator/Blades)", (3.5, 0.5), textcoords="offset points", xytext=(0, -20), ha='center', color='red')

    # Pole mounts
    axs[i].plot(1.5, 3.5, 'go')  # Left pole mount
    axs[i].plot(4.5, 3.5, 'go')  # Right pole mount
    axs[i].annotate("Left Pole Mount", (1.5, 3.5), textcoords="offset points", xytext=(-15, 10), ha='center', color='green')
    axs[i].annotate("Right Pole Mount", (4.5, 3.5), textcoords="offset points", xytext=(15, 10), ha='center', color='green')

plt.tight_layout()
plt.show()
